# -*- encoding : utf-8 -*-
#

require 'jvn_segmenter'
require 'json'

## curl -d 'text=N%C3%B3%20l%C3%A0%20m%E1%BB%99t%20b%E1%BA%A3n%20tuy%C3%AAn%20ng%C3%B4n%20%C4%91%E1%BA%B7c%20s%E1%BA%AFc%20c%E1%BB%A7a%20ch%E1%BB%A7%20ngh%C4%A9a%20nh%C3%A2n%20%C4%91%E1%BA%A1o%20%2C%20m%E1%BB%99t%20ti%E1%BA%BFng%20chu%C3%B4ng%20c%E1%BA%A3nh%20t%E1%BB%89nh%20tr%C6%B0%E1%BB%9Bc%20hi%E1%BB%83m%20h%E1%BB%8Da%20l%E1%BB%9Bn%20lao%20c%E1%BB%A7a%20h%C3%A0nh%20tinh%20tr%C6%B0%E1%BB%9Bc%20s%E1%BB%B1%20%C4%91i%C3%AAn%20r%E1%BB%93%20c%E1%BB%A7a%20nh%E1%BB%AFng%20k%E1%BA%BB%20cu%E1%BB%93ng%20t%C3%ADn%20.' http://still-taiga-9764.herokuapp.com

post "/?" do
  segmenter = JvnSegmenter.new
  text = params[:text]
  segmented_text = segmenter.segment text
  array = segmented_text.scan(/\[([^\]]*)\]/)
  Hash[(0...array.size).zip array].to_json
end