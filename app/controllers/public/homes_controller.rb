class Public::HomesController < ApplicationController
  def top
    @items=Item.all.order(id: "DESC")
    @genre=Genre.all
  end
  
  def about
  end
end
