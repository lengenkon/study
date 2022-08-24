module Exercise
  module Arrays
    class << self
      def my_max(array)
        max = array[0]
        array.each { |item| max = item if item > max }
        max
      end

      def replace(array)
        array.map! { |item| item.positive? ? my_max(array) : item }
      end

      def search(array, query, first = 0, last = array.size - 1)
        return -1 if first > last && query > last

        middle = (last + first) / 2
        return middle if query == array[middle]

        array[middle] < query ? search(array, query, middle + 1, last) : search(array, query, first, middle - 1)
      end
    end
  end
end
