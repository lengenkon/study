module Exercise
  module Fp2
    class MyArray < Array
      def my_each(array = self, &block)
        return MyArray.new(array) if empty?

        first, *rest = self
        block.call(first)
        MyArray.new(rest).my_each(array, &block)
      end

      def my_reduce(accumulator = nil, &block)
        if accumulator.nil?
          ignore_first = true
          accumulator = self[0]
        end

        index = 0

        my_each do |element|
          accumulator = block.call(accumulator, element) unless ignore_first && index.zero?
          index += 1
        end
        accumulator
      end

      def my_map
        my_reduce(MyArray.new) { |acc, element| acc << (yield element) }
      end

      def my_compact
        my_reduce(MyArray.new) do |acc, element|
          acc << element unless element.is_a? NilClass
          acc
        end
      end
    end
  end
end
