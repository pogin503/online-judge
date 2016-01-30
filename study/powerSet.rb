#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# @see http://www.thelearningpoint.net/computer-science/introduction-to-ruby---computing-a-power-set-an-example-of-recursion
# Powerset
class Powerset
  def printPowerSet(index, elements, current_subset)
    if index == elements.length
      puts current_subset.join(" : ")
    else
      powerSet(index + 1, elements, current_subset)
      powerSet(index + 1, elements, current_subset + [elements[index]])
    end
  end
  def powerSet(index, elements, current_subset)
    if index == elements.length
      return [current_subset]
    else
      ret = powerSet(index + 1, elements, current_subset)
      ret += powerSet(index + 1, elements, current_subset + [elements[index]])
      return ret
    end
  end
  def start
    p powerSet(0, ["X", "Y", "Z"], [])
    p powerSet(0, ["A", "B", "C", "D", "E", "F", "G", "H"], [])
  end
end

Powerset.new.start
