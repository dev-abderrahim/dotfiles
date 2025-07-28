if true then
  return {}
end

return {
  'sphamba/smear-cursor.nvim',
  event = 'VeryLazy',
  opts = {
    -- Smooth without smear
    -- stiffness = 0.5,
    -- trailing_stiffness = 0.5,
    -- damping = 0.67,
    -- matrix_pixel_threshold = 0.5,

    stiffnes = 0.7,
    -- cursor_color = "#FFCC00", -- or "none" to match under cursor color
  },
}
