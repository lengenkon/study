module Exercise
  module Arrays
    class << self
      def replace(array)
        new_array = []
        max = array[0]
        array.each { |item| max = item if item > max }
        array.each { |item| new_array << (item.positive? ? max : item) }
        new_array
      end

      def search(array1, query)
        l = array1.size - 1
        f = 0
        while f <= l
          m = (l + f) / 2
          if query > array1[m]
            f = m + 1
          elsif query < array1[m]
            l = m - 1
          else
            return m
          end
        end
        -1
      end
    end
  end
end
