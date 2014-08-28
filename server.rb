# -*- encoding : utf-8 -*-
#

require 'jvn_segmenter'
require 'json'

def segmenter
  @@segmenter ||= JvnSegmenter.new
end

post "/?" do
  return 403 unless params[:key] == ENV['KEY']
  text = params[:text]
  segmented_text = segmenter.segment text
  segmented_text.scan(/\[([^\]]*)\]/).flatten.to_json
end
