module Exercise
  module Fp2
    class MyArray < Array
      def my_each(&block)
        return self if empty?

        first, *rest = self
        block.call(first)
        MyArray.new(rest).my_each(&block)
        self
      end

      def my_reduce(acc = nil, &block)
        return acc if empty?

        first, *rest = self
        acc = acc.nil? ? first : block.call(acc, first)
        MyArray.new(rest).my_reduce(acc, &block)
      end

      def my_map
        my_reduce(MyArray.new) { |acc, element| acc << (yield element) }
      end

      def my_compact
        my_reduce(MyArray.new) do |acc, element|
          acc << element unless element.nil?
          acc
        end
      end
    end
  end
end
