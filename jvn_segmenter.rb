# -*- encoding : utf-8 -*-
require 'JVnSegmenter.jar'

class JvnSegmenter
  java_import 'JVnSegmenter.JVnSegmenter'
  java_import 'JVnSegmenter.TaggingInputData'

  def model_dir
    @model_dir ||= 'models'.to_s
  end

  # one way to memoise
  def segmenter
    @segmenter ||= Java::JVnSegmenter::JVnSegmenter.new.tap do |ws|
      raise "Can't read model files" unless ws.init(model_dir)
    end
  end

  # another way to memoise
  def tagger_data
    @tagger_data ||=
    begin
      tg = Java::JVnSegmenter::TaggingInputData.new
      raise "Can't read tagger data" unless tg.init(model_dir)
      tg
    end
  end

  # pass in string containing sentences (one per sentence), get back a string
  # with [] around each word.
  def segment( input_text )
    tagger_data.readOriginalDataFromString input_text
    segmenter.wordBoundaryMark tagger_data
  end
end
