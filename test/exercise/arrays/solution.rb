module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        my_max = ->(item) { max = item if item > max }
        array.each(&my_max)
        array.map! { |item| item.positive? ? max : item }
        array
      end

      def search(array, query, first = nil, last = nil)
        if first.nil? && last.nil?
          first = 0
          last = array.size - 1
        end
        if first > last
          -1
        else
          middle = (last + first) / 2
          if query == array[middle]
            middle
          elsif array[middle] < query
            search(array, query, middle + 1, last)
          else
            search(array, query, first, middle - 1)
          end
        end
      end
    end
  end
end
