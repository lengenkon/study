module Exercise
  module Arrays
    class << self
      def my_max(array)
        max = array[0]
        array.each { |item| max = item if item > max }
        max
      end

      def replace(array)
        max = my_max(array)
        array.map! { |item| item.positive? ? max : item }
      end

      def search(array, query, first = 0, last = array.size - 1)
        return -1 if first > last || query > array[last] || query < array[first]

        middle = (last + first) / 2
        return middle if query == array[middle]

        array[middle] < query ? search(array, query, middle + 1, last) : search(array, query, first, middle - 1)
      end
    end
  end
end
