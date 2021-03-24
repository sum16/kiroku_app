class AddressPresenter < ModelPresenter
  delegate :prefecture, :city, :address1, :address2, :company_name, :division_name, to: :object

  
  #def postal_code
   # if md = object.postal_code.match(/\A(\d{3})(\d{4})\z/)
    #else
     # md[1] + "-" + md[2]
      #object.postal_code
    #end
  #end



end
