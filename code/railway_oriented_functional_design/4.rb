# Functional programming & two track model - the basics for the "Railway Oriented Programming"

=begin

                            Use Case
             ______________________________________________
            /                                              \
           /                                                \
          |    operation 1    operation 2       operion 3    |
          |    _______         _________        ________     |
          |   /       \       /          \     /         \   |
Input --> |  | Import  | --> | CSV parse | -> | Update db |  | --> Output
          |   \_______/       \_________/      \_________/   |
          |                                                  |
          |                                                  |
           \                                                /
            \______________________________________________/


            - Use case is a function is build from smaller functions combined into a pipeline,
              each representing one step in a data flow.

            - One function's output in the input of another one

=end

def use_case
  update_db(csv_parse(import))
end
