module Exercise
  module Fp2
    class MyArray < Array
      def my_each
        each { |element| yield element }
      end

      def my_map
        reduce(MyArray.new) { |acc, element| acc << (yield element) }
      end

      def my_compact
        reduce(MyArray.new) do |acc, element|
          acc << element unless element.is_a? NilClass
          acc
        end
      end

      def my_reduce(acc = nil, &block)
        if acc.nil?
          ignore_first = true
          acc = self[0]
        end

        index = 0

        each do |element|
          acc = block.call(acc, element) unless ignore_first && index.zero?
          index += 1
        end
        acc
      end
    end
  end
end
