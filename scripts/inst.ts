import { exec } from 'node:child_process'
import { cp } from 'node:fs/promises'
import os from 'node:os'
import path from 'node:path'
import util from 'node:util'

const homeDir = os.homedir()
const homeConfig = `${homeDir}/.config`

const configList: Array<[string, string?, boolean?]> = [
  ['.gitconfig', homeDir],
  ['.ssh', homeDir],
  ['.zshrc', homeDir],
  ['akind-git-commit-template'],
  ['akind.gitconfig'],
  ['btop'],
  ['foot'],
  ['fuzzel'],
  ['helix'],
  ['jj'],
  ['mako'],
  ['niri'],
  ['starship.toml'],
  ['zsh-base.sh'],
  ['keyd', '/etc', true],
]

const getArgs = () =>
  util.parseArgs({
    options: {
      list: {
        type: 'boolean',
        short: 'l',
      },
      all: {
        type: 'boolean',
        short: 'a',
      },
      overwrite: {
        type: 'boolean',
        short: 'o',
      },
    },
    allowPositionals: true,
  })

const printUsage = () => {
  console.log('Usage: node scripts/inst.ts [-a] [-o] [...names]')
  console.log('')
  console.log('Install either all configs (-a), or configs by name')
  console.log('')
  console.log('--all, -a       select all configs')
  console.log('--overwrite, -o overwrite existing configuration')
}

const allConfig = () =>
  configList.reduce((conf, [source, target = homeConfig, sudo = false]) => {
    const arr = conf.get(source) ?? []

    arr.push({
      source,
      target: path.join(target, source),
      sudo,
    })

    conf.set(source, arr)

    return conf
  }, new Map<string, Array<{ source: string; target: string; sudo: boolean }>>())

const main = async () => {
  const { values, positionals } = getArgs()
  const map = allConfig()

  if (values.list) {
    ;[...map.keys()].forEach((k) => {
      console.log(k)
    })
    return
  }

  if (
    values.all === undefined &&
    values.overwrite === undefined &&
    positionals.length === 0
  ) {
    printUsage()
    return
  }

  const installables = (values.all ? [...map.keys()] : positionals).flatMap(
    (name) => [...(map.get(name) ?? [])],
  )

  for (const { source, target, sudo } of installables) {
    const output = `Installing ${source} -> ${target} ...`

    process.stdout.write(output)
    if (sudo) {
      exec(
        `sudo cp --update=${values.overwrite ? 'none' : 'all'} ${source} ${target}`,
      )
      process.stdout.cursorTo(output.length)
      process.stdout.write(` done [sudo]\n`)
      continue
    }

    await cp(source, target, {
      recursive: true,
      force: values.overwrite ?? false,
    })

    process.stdout.cursorTo(output.length)
    process.stdout.write(` done\n`)
  }
}

main().catch((err) => {
  console.log(err)
})
