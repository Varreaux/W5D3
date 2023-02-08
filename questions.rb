require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end



class Question


    def Find_by_ID(int)
        Question.new(QuestionsDBConnection.instance.execute(SELECT * FROM questions WHERE id = int))

    end



    def initialize(question)
        @id = question['id']
        @title = question['title']
        @body = question['body']
        @author_id = question['question_author_id']
    end
end



