class Peppers

  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  store_in collection: "peppers"

end