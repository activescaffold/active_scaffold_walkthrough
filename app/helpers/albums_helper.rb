module AlbumsHelper
  def price_column(record)
    number_to_currency(record.price)
  end
  
  def price_form_column(record, name)
    "$%s" % text_field(:record, :price, :class => "short")
  end
end
