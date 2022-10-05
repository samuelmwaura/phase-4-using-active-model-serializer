class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year,:length, :summary #Remember this is a ruby method and can be invoked with brackets

  #A serializer takes the functionality of the only and except kewords when we are setting the exact attributes that we want sent back in the response
  #Instead of leaving the functionality of designing the response to the controller in the render json function, the serializers offloads code from the controller
  #actions and  helps seperate concerns
  #It is given the same name as the model
  #besides the attributes, custom instance methods are also included in the serializer

  def summary
    "#{self.object.title} - #{self.object.description[0..49]...}"
    #Self refers to the MovieSerializer instance while object refers to the movie instance that is being rendered, or being worked on at the moment.
  end

  #This instance method is placed here since it is also included when sending response back to the user/client.
end
