-- config/dashboard.lua
local M = {}

-- Configuration constants
local CONFIG = {
  quote_wrap_width = 100,
  project_limit = 5,
  mru_limit = 8,
}

-- ASCII art header
local HEADER = {
  '',
  '                                                                     ',
  '       ████ ██████           █████      ██                     ',
  '      ███████████             █████                             ',
  '      █████████ ███████████████████ ███   ███████████   ',
  '     █████████  ███    █████████████ █████ ██████████████   ',
  '    █████████ ██████████ █████████ █████ █████ ████ █████   ',
  '  ███████████ ███    ███ █████████ █████ █████ ████ █████  ',
  ' ██████  █████████████████████ ████ █████ █████ ████ ██████ ',
  '',
}

-- Programming quotes database
local QUOTES = {
  -- =======================================================
  -- Philosophy & The Big Picture
  -- =======================================================
  'The most important property of a program is whether it accomplishes the intention of its user. - C.A.R. Hoare',
  'Programs must be written for people to read, and only incidentally for machines to execute. - Harold Abelson',
  'The computer is a vehicle for the mind, and software is the fuel. - Alan Kay',
  "Technology is anything that wasn't around when you were born. - Alan Kay",
  'Simplicity is the ultimate sophistication. - Leonardo da Vinci',
  "The advance of technology is based on making it fit in so that you don't really even notice it, so it's part of everyday life. - Bill Gates",
  'The art of programming is the art of organizing complexity. - Edsger W. Dijkstra',
  'The best way to predict the future is to invent it. - Alan Kay',
  'Knowledge is power. - Francis Bacon',
  'To be yourself in a world that is constantly trying to make you something else is the great accomplishment. - Ralph Waldo Emerson',

  -- =======================================================
  -- The Craft of Programming & Code Quality
  -- =======================================================
  'Any fool can write code that a computer can understand. Good programmers write code that humans can understand. - Martin Fowler',
  'First, solve the problem. Then, write the code. - John Johnson',
  'Make it work, make it right, make it fast. - Kent Beck',
  "Code is like humor. When you have to explain it, it's bad. - Cory House",
  'Good code is its own best documentation. - Steve McConnell',
  'The ratio of time spent reading versus writing is well over 10 to 1. We are constantly reading old code as part of the effort to write new code. ...[Therefore,] making it easy to read makes it easy to write. - Robert C. Martin',
  'Simplicity is prerequisite for reliability. - Edsger W. Dijkstra',
  'There are two ways of constructing a software design: One way is to make it so simple that there are obviously no deficiencies, and the other way is to make it so complicated that there are no obvious deficiencies. - C.A.R. Hoare',
  'Clarity is the most important quality in programming. - Bjarne Stroustrup',
  'Code never lies, comments sometimes do. - Ron Jeffries',
  'Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live. - John Woods',

  -- =======================================================
  -- Design, Architecture & Simplicity
  -- =======================================================
  'Perfection is achieved not when there is nothing more to add, but rather when there is nothing more to take away. - Antoine de Saint-Exupery',
  'There is nothing so useless as doing efficiently that which should not be done at all. - Peter Drucker',
  'Design is not just what it looks like and feels like. Design is how it works. - Steve Jobs',
  'Premature optimization is the root of all evil. - Donald Knuth',
  'The best error message is the one that never shows up. - Thomas Fuchs',
  'Measuring programming progress by lines of code is like measuring aircraft building progress by weight. - Bill Gates',
  'Good design adds value faster than it adds cost. - Thomas C. Gale',
  'Simplicity, carried to an extreme, becomes elegance. - Jon Franklin',

  -- =======================================================
  -- Debugging & Problem Solving
  -- =======================================================
  'Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it. - Brian Kernighan',
  "Sometimes it pays to stay in bed on Monday, rather than spending the rest of the week debugging Monday's code. - Dan Salomon",
  'If debugging is the process of removing software bugs, then programming must be the process of putting them in. - Edsger W. Dijkstra',
  'The most effective debugging tool is still careful thought, coupled with judiciously placed print statements. - Brian Kernighan',
  'One of the best programming skills you can have is knowing when to walk away for a while. - Oscar Godson',
  "When you have a bug, it's not a mystery. It's a fact. Your code is doing exactly what you told it to do. - Michael Feathers",

  -- =======================================================
  -- Innovation, Motivation & Work Ethic
  -- =======================================================
  'The only way to do great work is to love what you do. - Steve Jobs',
  'Innovation distinguishes between a leader and a follower. - Steve Jobs',
  'Talk is cheap. Show me the code. - Linus Torvalds',
  'In order to be irreplaceable, one must always be different. - Coco Chanel',
  'The secret of getting ahead is getting started. - Mark Twain',
  "Success is a lousy teacher. It seduces smart people into thinking they can't lose. - Bill Gates",
  'Stay hungry, stay foolish. - Steve Jobs',
  'Experience is the name everyone gives to their mistakes. - Oscar Wilde',

  -- =======================================================
  -- Humor, Wit & Truths
  -- =======================================================
  'Java is to JavaScript what car is to Carpet. - Chris Heilmann',
  'There are only two hard things in Computer Science: cache invalidation and naming things. - Phil Karlton',
  'The first 90 percent of the code accounts for the first 90 percent of the development time. The remaining 10 percent of the code accounts for the other 90 percent of the development time. - Tom Cargill',
  'Walking on water and developing software from a specification are easy if both are frozen. - Edward V. Berard',
  'Programming today is a race between software engineers striving to build bigger and better idiot-proof programs, and the Universe trying to produce bigger and better idiots. So far, the Universe is winning. - Rich Cook',
  "I don't care if it works on your machine! We are not shipping your machine! - Vidiu Platon",
  "It's not a bug – it's an undocumented feature. - Anonymous",
  'Ruby is rubbish! PHP is phpantastic! - Nikita Popov',
  'A good programmer is someone who always looks both ways before crossing a one-way street. - Doug Linder',
}

-- Utility functions
local function wrap_text(text, max_width)
  max_width = max_width or 80

  if #text <= max_width then
    return { text }
  end

  local lines = {}
  local current_line = ''
  local words = vim.split(text, '%s+')

  for _, word in ipairs(words) do
    local test_line = current_line == '' and word or current_line .. ' ' .. word

    if #test_line <= max_width then
      current_line = test_line
    else
      if current_line ~= '' then
        table.insert(lines, current_line)
      end
      current_line = word
    end
  end

  if current_line ~= '' then
    table.insert(lines, current_line)
  end

  return lines
end

local function get_random_quote()
  math.randomseed(os.time())
  return QUOTES[math.random(#QUOTES)]
end

local function create_footer()
  local footer = { '', '' }
  local quote = ' ' .. get_random_quote() .. '  '
  local wrapped_lines = wrap_text(quote, CONFIG.quote_wrap_width)

  for _, line in ipairs(wrapped_lines) do
    table.insert(footer, line)
  end

  return footer
end

-- Action handlers
local function create_file_picker(cwd)
  return function()
    if Snacks and Snacks.picker then
      Snacks.picker.files { cwd = cwd }
    else
      vim.notify('Snacks.picker not available', vim.log.levels.WARN)
    end
  end
end

local function create_recent_picker()
  return function()
    if Snacks and Snacks.picker then
      Snacks.picker.recent()
    else
      vim.notify('Snacks.picker not available', vim.log.levels.WARN)
    end
  end
end

-- Shortcut definitions
local function get_shortcuts()
  return {
    {
      desc = ' Updates',
      group = '@boolean',
      key = 'u',
      action = 'Lazy update',
    },
    {
      desc = '󰥨 Find',
      group = 'Number',
      key = 'f',
      action = create_file_picker '~/',
    },
    {
      desc = ' Dotfiles',
      group = '@function',
      key = 'd',
      action = create_file_picker '~/.dotfiles/',
    },
    {
      desc = ' Config',
      group = '@attribute.builtin',
      key = 'c',
      action = create_file_picker '~/.config/nvim/',
    },
    {
      desc = ' Recents',
      group = 'Keyword',
      key = 'r',
      action = create_recent_picker(),
    },
  }
end

-- Main setup function
function M.setup()
  -- Set global variables for dashboard
  vim.g.dashboard_custom_header = HEADER
  vim.g.dashboard_custom_footer = create_footer()

  -- Dashboard configuration
  local dashboard_config = {
    theme = 'hyper',
    disable_move = true,
    shortcut_type = 'letter',
    shuffle_letter = false,
    change_to_vcs_root = false,
    dashboard_change_to_dir = true,
    config = {
      header = vim.g.dashboard_custom_header,
      week_header = {
        enable = false,
      },
      packages = {
        enable = true,
      },
      shortcut = get_shortcuts(),
      project = {
        action = function(path)
          if Snacks and Snacks.picker then
            Snacks.picker.files { cwd = path }
          end
        end,
        enable = true,
        limit = CONFIG.project_limit,
        icon = ' ',
        label = 'Recent Projects',
      },
      mru = {
        enable = true,
        icon = ' ',
        limit = CONFIG.mru_limit,
        label = 'Recently edited',
        cwd_only = false,
      },
      footer = vim.g.dashboard_custom_footer,
    },
    hide = {
      statusline = true,
      tabline = true,
      winbar = true,
    },
    preview = {},
  }

  require('dashboard').setup(dashboard_config)
end

-- Plugin specification
return {
  'nvimdev/dashboard-nvim',
  dependencies = {
    'echasnovski/mini.icons',
  },
  event = 'VimEnter',
  init = M.setup,
  config = function()
    -- Configuration is handled in init
  end,
}
