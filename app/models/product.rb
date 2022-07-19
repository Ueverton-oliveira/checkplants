class Product < ApplicationRecord
  belongs_to :store
  validates_presence_of :name

  def preparation_time(cooking_time, first_hourglass, last_hourglass)
    hourglass_smaller, hourglass_larger = [first_hourglass, last_hourglass].minmax

    difference = hourglass_larger - hourglass_smaller

    return puts 'Nao foi possivel calcular' if diferenca.zero?

    if difference == cooking_time
      puts "O tempo total foi de #{hourglass_larger} minutos"
    else
      hourglass_smaller += hourglass_smaller
      calcular_tempo_preparo(cooking_time, hourglass_smaller, hourglass_larger)
    end
  end
end
