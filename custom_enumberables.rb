module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self
      yield element
    end
  end

  def my_each_with_index
    return to_enum(:my_each) unless block_given?

    idx = 0
    for element in self
      yield element, idx
      idx += 1
    end
  end

  def my_select
    if instance_of?(Hash)
      select_container = {}
      self.my_each { |key, val| select_container[key] = val if yield(key, val) == true }
    else
      select_container = []
      self.my_each { |element| select_container << element if yield(element) == true }
    end
    select_container
  end

  def my_all?
    if block_given?
      self.my_each { |element| return false if yield(element) == false }
    else
      self.my_each { |element| return false if element == false }
    end

    true
  end

  def my_any?
    if block_given?
      self.my_each { |element| return true if yield(element) == true }
    else
      self.my_each { |element| return true if element == true }
    end

    false
  end

  def my_none?
    if block_given?
      self.my_each { |element| return false if yield(element) == true }
    else
      self.my_each { |element| return false if element == true }
    end

    true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    self.my_each { |element| count += 1 if yield(element) == true }
    count
  end

  def my_map
    mapped_array = []
    self.my_each { |element| mapped_array << yield(element) }
    mapped_array
  end

  def my_map_w_proc(proc)
    mapped_array = []
    self.my_each { |element| mapped_array << proc.call(element) }
    mapped_array
  end

  def my_map_w_proc_or_block(proc = (proc_not_passed = true; nil))
    mapped_array = []

    unless proc_not_passed
      self.my_each { |element| mapped_array << proc.call(element) }
    else
      self.my_each { |element| mapped_array << yield(element) }
    end

    mapped_array
  end

  def my_inject(initial = (initial_not_passed = true; nil), &sym)
    tmp = self.to_a.dup
    initial = tmp.shift if initial_not_passed

    tmp.my_each { |element| initial = yield(initial, element) }
    initial
  end
end
