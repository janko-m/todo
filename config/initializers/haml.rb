require "haml"
require "redcarpet"

module Haml
  module Filters

    remove_filter "Markdown"

    module Markdown
      include Base

      def render(text)
        redcarpet = Redcarpet::Markdown.new(HTMLWithPygments, fenced_code_blocks: true)
        redcarpet.render(text)
      end
    end

  end
end
