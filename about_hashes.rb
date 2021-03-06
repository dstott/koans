require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutHashes < Neo::Koan
  def test_creating_hashes
    empty_hash = Hash.new
    assert_equal Hash, empty_hash.class        ### a student answers
    assert_equal({}, empty_hash)               ### a student answers
    assert_equal 0, empty_hash.size            ### a student answers
  end

  def test_hash_literals
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.size                  ### a student answers
  end

  def test_accessing_hashes
    hash = { :one => "uno", :two => "dos" }
    assert_equal "uno", hash[:one]             ### a student answers
    assert_equal "dos", hash[:two]             ### a student answers
    assert_equal nil, hash[:doesnt_exist]      ### a student answers
  end

  def test_accessing_hashes_with_fetch
    hash = { :one => "uno" }
    assert_equal "uno", hash.fetch(:one)       ### a student answers
    assert_raise(KeyError) do                  ### a student answers
      hash.fetch(:doesnt_exist)
    end

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?
  end

  def test_changing_hashes
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"                                     ### a student answers

    expected = { :one => "eins", :two => "dos" }
    assert_equal expected, hash                             ### a student answers

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?
  end

  def test_hash_is_unordered
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    assert_equal true, hash1 == hash2                       ### a student answers
  end

  def test_hash_keys
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.keys.size                          ### a student answers
    assert_equal true, hash.keys.include?(:one)             ### a student answers
    assert_equal true, hash.keys.include?(:two)             ### a student answers
    assert_equal Array, hash.keys.class                     ### a student answers
  end

  def test_hash_values
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.values.size                        ### a student answers
    assert_equal true, hash.values.include?("uno")          ### a student answers
    assert_equal true, hash.values.include?("dos")          ### a student answers
    assert_equal Array, hash.values.class                   ### a student answers
  end

  def test_combining_hashes
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    assert_equal true, hash != new_hash                    ### a student answers

    expected = { "jim" => 54, "amy" => 20, "dan" => 23, "jenny" => 26 }    ### a student answers
    assert_equal true, expected == new_hash                                ### a student answers
  end

  def test_default_value
    hash1 = Hash.new
    hash1[:one] = 1

    assert_equal 1, hash1[:one]                            ### a student answers
    assert_equal nil, hash1[:two]                          ### a student answers

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    assert_equal 1, hash2[:one]                            ### a student answers
    assert_equal "dos", hash2[:two]                        ### a student answers
  end

  def test_default_value_is_the_same_object
    hash = Hash.new([])

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal [ "uno", "dos" ], hash[:one]              ### a student answers
    assert_equal [ "uno", "dos" ], hash[:two]              ### a student answers
    assert_equal [ "uno", "dos" ], hash[:three]            ### a student answers

    assert_equal true, hash[:one].object_id == hash[:two].object_id    ### a student answers
  end

  def test_default_value_with_block
    hash = Hash.new {|hash, key| hash[key] = [] }

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal [ "uno" ], hash[:one]                     ### a student answers
    assert_equal [ "dos" ], hash[:two]                     ### a student answers
    assert_equal [], hash[:three]                          ### a student answers
  end
end
