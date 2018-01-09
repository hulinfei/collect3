require 'importex'
class School < Importex::Base
  include Mongoid::Document
  field :number, type: Integer
  field :name, type: String
  field :sex, type: Integer
  field :id_card, type: String
  field :mobile, type: Integer
end
