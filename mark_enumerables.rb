# rubocop:disable Metrics/ModuleLength
module Enumerable
  # 1. my_each accepts a proc, block or single argument = each
  def my_each(*pro)
    # proc
    unless pro[0].nil?
      size.times do |item|
        pro[0].call self[item]
      end
    end
    # yield /block
    return to_enum(:my_each) unless block_given?

    arr = []
    size.times do |item|
      # block.call self[item]
      arr = yield self[item]
    end
  end

  # 2 my_each_with_index = each_with_index
  def my_each_with_index(*_pro)
    unless pro[0].nil?
      size.times do |item|
        pro[0].call self[item]
      end
    end

    return to_enum(:my_each_with_index) unless block_given?

    size.times do |item|
      yield self[item], item
    end
  end

  # prototypes for dealing with a proc and a block ,used in my_each above
  def my_each_proc(proc)
    size.times do |item|
      proc.call self[item]
    end
  end

  def my_each_yield
    return to_enum(:my_each) unless block_given?

    size.times do |item|
      yield self[item]
    end
  end

  # 3. my_selct  =  select
  def my_select
    arr2 = []
    my_each do |item|
      arr2 << item if yield(item)
    end
    arr2
  end

  # 4 my_all? =  all?
  def my_all?(*pro)
    ans = true
    my_each do |item|
      if pro[0].nil?
        return to_enum(:my_all) unless block_given?
        return false unless yield(item)
      else
        return false unless item.match(pro[0])

        break
      end
    end
    ans
  end

  # 5 my_any? =  any?
  def my_any?(*pro)
    ans = false
    my_each do |item|
      if pro[0].nil?
        return to_enum(:my_all) unless block_given?
        return true if yield(item)
      elsif item.match(pro[0])
        return true
      end
    end
    ans
  end

  # 6 my_none?  = none?
  def my_none?(arg = nil)
    result = true
    case arg
    when nil
      return to_enum(:my_none) unless block_given?

      my_each do |item|
        result = yield(self[item])
        return false if result == true
      end
    else
      my_each do |item|
        result = self[item] == arg
        return false if result == true
      end
    end
    true
  end

  # 7 my_count = count
  def my_count(items = 0)
    total = 0
    size.times do |item|
      case items
      when 0
        return size
      when self[item]
        total += 1
      end
    end
    total
  end

  # 8 my_inject =  reduce method
  def my_inject(num = nil, symb = nil)
    arr = to_a # handles situation where a Range (5..10).my_inject is passed as self
    total = arr[0]
    case num
    when nil
      return to_enum(:my_inject) unless block_given?

      (size - 1).times { |item| total = yield(total, arr[item + 1]) }
    when Integer
      total = num
      my_each do |item|
        case symb
        when nil
          block_given? ? total = yield(total, arr[item]) : total += arr[item]
        else
          total = total.send symb, arr[item]
        end
      end
    else
      (size - 1).times { |item| total = total.send num, arr[item + 1] }
    end
    total
  end
end

#-----------------TEST CASES---------------------------#
# array = %w[mark rida john mark]

# block.call == yield

# array.my_each { |names| puts names }
# array.my_each_with_index { |names| puts names }
# %w[Marc Luc Jean].my_method('Jean')

# array.my_select { |names| names != 'mark' }

# puts %w[Marc Luc Jean].my_all?('Jean')
# puts %w[Marc Lac Jean].my_all?(/a/)
# puts %w[Jean].my_all?('Jean')

# (5..10).my_inject(:+)
# [2, 3, 5, 6, 1, 7, 5, 3, 9].my_inject(:+)
# (5..10).my_inject { |sum, n| sum + n }
# [2, 3, 5, 6, 1, 7, 5, 3, 9].my_inject { |sum, n| sum + n }
# (5..10).my_inject(1, :*)
# [2, 3, 5, 6, 1, 7, 5, 3, 9].my_inject(1, :*)
# (5..10).my_inject(1) { |element, n| element * n }
# [2, 3, 5, 6, 1, 7, 5, 3, 9].my_inject(1) { |element, n| element * n }
# puts ''

# pro = proc { |names| puts names }
#  array.my_each_proc(pro)
# array.my_each(pro)
# array.each

# def multiply_els(array)
#   array.my_inject { |new_st, friend| new_st * friend }
# end

# multiply_els([2,4,5])

#------------END OF TEST CASES--------------------------------
# rubocop:enable Metrics/ModuleLength
