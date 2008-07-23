module AlbumsHelper
  def price_column(record)
    number_to_currency(record.price)
  end
end
