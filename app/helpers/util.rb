require 'thor/core_ext/hash_with_indifferent_access'
PadrinoEbook.helpers do
  # Recursively convert a normal Hash into a HashWithIndifferentAccess
  #
  # @private
  # @param [Hash] data Normal hash
  # @return [Thor::CoreExt::HashWithIndifferentAccess]
  def recursively_enhance(data)
    if data.is_a? Hash
      data = ::Thor::CoreExt::HashWithIndifferentAccess.new(data)
      data.each do |key, val|
        data[key] = recursively_enhance(val)
      end
      data
    elsif data.is_a? Array
      data.each_with_index do |val, i|
        data[i] = recursively_enhance(val)
      end
      data
    else
      data
    end
  end
  
  def current_page?(*options)
    request.path_info=~/^#{url(*options)}$/
  end
end
