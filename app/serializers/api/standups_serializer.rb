module Api
    class StandupsSerializer
      def initialize(standups)
        @standups = standups
      end
  
      def as_json
        full_standups
      end
  
      private
  
      def full_standups
        standups.map do |standup|
          {
            id: standup.id,
            standup_date: standup.standup_date,
            user: {
              name: standup.user.name,
              id: standup.user.id
            },
            todos: standup.todos.map do |todo|
              {
                id: todo.id,
                title: todo.title
              }
            end,
            dids: standup.dids.map do |did|
              {
                id: did.id,
                title: did.title
              }
            end,
            blockers: standup.blockers.map do |blocker|
              {
                id: blocker.id,
                title: blocker.title
              }
            end
          }
        end
      end
  
      attr_reader :standups
    end
  end  