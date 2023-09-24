require('telescope').setup({
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        width = 0.9,
        height = 0.9
      }
    }
  }
})
require('telescope').load_extension('fzf')
