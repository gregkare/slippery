require 'base64'
require 'pathname'
require 'open-uri'
require 'forwardable'

require 'kramdown'
require 'hexp'
require 'concord'
require 'asset_packer'

# Slippery namespace module
module Slippery
  ROOT = Pathname(__FILE__).dirname.parent

  def self.convert(element)
    Slippery::Converter.new.convert(element)
  end
end

require 'slippery/version'
require 'slippery/converter'
require 'slippery/document'
require 'slippery/presentation'

require 'slippery/processor_helpers'

require 'slippery/processors/add_google_font'
require 'slippery/processors/graphviz_dot'
require 'slippery/processors/hr_to_sections'
require 'slippery/processors/add_highlight'

require 'slippery/processors/impress_js/add_impress_js'
require 'slippery/processors/impress_js/auto_offsets'

require 'slippery/processors/reveal_js/add_reveal_js'

require 'slippery/rake_tasks'
