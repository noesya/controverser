class Chatgpt
  attr_reader :answer

  def initialize(title, text)
    @title = title
    @text = text
  end

  def answer
    unless @answer
      @answer = response['choices'].first['message']['content']
      if @answer.include? '```json'
        @answer = @answer.split('```json').last.split('```').first
      end
    end
    @answer
  end

  def summary_long
    json['summary_long']
  end
    
  def summary_short
    json['summary_short']
  end

  def concepts
    json['concepts']
  end

  protected


  def client
    @client ||= OpenAI::Client.new  access_token: ENV['OPENAI_API_KEY'],
                                    organization_id: ENV['OPENAI_ORGANIZATION_ID']
  end

  def response
    @response ||= client.chat(
      parameters: {
        # model: "gpt-4",
        model: "gpt-3.5-turbo-16k",
        messages: [
          {
            "role": "system", 
            "content": "Tu es un assistant de recherche scientifique."
          },
          {
            "role": "user",
            "content": "Voilà un article titré \"#{@title}\", dont le texte est le suivant : \"#{@text}\"",
          },
          {
            "role": "user",
            "content": "Peux-tu me donner au format json 
              (sans texte avant et après, juste le json brut, ou si ce n'est pas possible le json dans un bloc de code markdown, avec ```json au début et ``` à la fin) 
              le résumé en 100 signes sous la forme d'une phrase (variable summary_short), 
              le résumé en 500 signes (variable summary_long) 
              et les concepts (variable concepts) ?",
          },
        ]
      }
    )
  end
end