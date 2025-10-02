class LangchainClient
  include Singleton

  attr_accessor :vector_search

  def initialize
    llm_openai = Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"])
    self.vector_search = Langchain::Vectorsearch::Pgvector.new(llm: llm_openai, index_name: "Documents", url: "postgresql://langchain_user:langchain_pwd@localhost/test_langchain_development")
  end
end
