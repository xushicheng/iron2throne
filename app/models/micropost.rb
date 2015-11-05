require 'nokogiri'
require 'open-uri'

class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :url, presence: true  #视频地址必须存在
  validates :content, length: { maximum: 140 }   #评论可以为空

  def video_iframe
    doc = Nokogiri::HTML(open(self.url))
    video_iframe = doc.at_css('#link3')['value'].to_s
  end

  def video_title(url)
    doc = Nokogiri::HTML(open(url))
    self.title = doc.at_css('h1.title').text
    self.url = url
    self.save
  end

  def self.random
    Micropost.all.sample
  end
end
