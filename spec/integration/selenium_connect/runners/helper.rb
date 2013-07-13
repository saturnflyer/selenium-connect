# Encoding: utf-8

class Google
  attr_accessor :page

  def initialize(driver)
    @page = driver
  end

  def visit
    page.get 'http://www.google.com'
  end

  def page_title
    page.title
  end
end
