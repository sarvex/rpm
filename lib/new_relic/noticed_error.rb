# this class encapsulates an error that was noticed by RPM in a managed app.
class NewRelic::NoticedError
  attr_accessor :path, :timestamp, :params, :exception_class, :message
  
  def initialize(path, data, exception)
    self.path = path
    self.params = data
    
    self.exception_class = exception.class.name
    
    if exception.respond_to?('original_exception')
      self.message = exception.original_exception.message
    else
      self.message = exception.message
    end

    self.timestamp = Time.now
  end
end