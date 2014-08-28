# -*- encoding : utf-8 -*-
#

require 'jvn_segmenter'
require 'json'

post "/?" do
  segmenter = JvnSegmenter.new
  text = params[:text]
  segmented_text = segmenter.segment text
  array = segmented_text.scan(/\[([^\]]*)\]/)
  Hash[(0...array.size).zip array].to_json
end