class PageController < ApplicationController
  def welcome
    @images  = ["image1.jpg", "image2.jpg", "image3.jpg","image4.jpg","image5.jpg","image6.jpg","image7.jpg","image8.jpg","image9.jpg"]
    @random_no = rand(9)
    @random_image = @images[@random_no]
    render layout: false
  end
end
