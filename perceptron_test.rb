require 'perceptron'
require 'minitest/autorun'
require 'minitest/pride'

class PerceptronTest < Minitest::Test

  def test_perceptron_has_threshold
    perceptron = Perceptron.new(10)

    assert_equal 10, perceptron.threshold
  end

  def test_perceptron_has_conditions_with_weights
    perceptron = Perceptron.new(1)
    conditions_with_weights = {"condition 1" => 3, "condition 2" => 1}

    perceptron.set_weights(conditions_with_weights)

    assert_equal conditions_with_weights, perceptron.weights
  end

  def test_perceptron_will_correctly_evaluate
    perceptron = Perceptron.new(7)

    perceptron.set_weights({
      "Is it sunny?" => 2,
      "Does my car work?" => 6,
      "Are my friends going?" => 4
    })

    # set what value the conditions will have
    perceptron.input({
      "Is it sunny?" => 0,
      "Does my car work?" => 1,
      "Are my friends going?" => 1
    })

    assert_equal true, perceptron.output
  end
end
