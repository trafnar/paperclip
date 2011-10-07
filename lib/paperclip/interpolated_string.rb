require 'uri'

class InterpolatedString < String
  def escaped?
    !!@escaped
  end

  def escape
    if !escaped?
      escaped_string = self.class.new(URI.escape(self))
      escaped_string.instance_variable_set(:@escaped, true)
      escaped_string
    else
      self
    end
  end

  def unescape
    if escaped?
      escaped_string = self.class.new(URI.unescape(self))
      escaped_string.instance_variable_set(:@escaped, false)
      escaped_string
    else
      self
    end
  end
end
