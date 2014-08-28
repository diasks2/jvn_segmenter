# -*- encoding : utf-8 -*-
#

require 'jvn_segmenter'
require 'json'

def segmenter
  @@segmenter ||= JvnSegmenter.new
end

post "/?" do
  return unless params[:key] == ENV['KEY']
  text = params[:text]
  segmented_text = segmenter.segment text
  array = segmented_text.scan(/\[([^\]]*)\]/)
  Hash[(0...array.size).zip array].to_json
end
