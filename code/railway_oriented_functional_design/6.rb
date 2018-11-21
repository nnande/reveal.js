# Functional programming & two track model - the basics for the "Railway Oriented Programming"

=begin

                            Use Case
             ______________________________________________
            /                                              \
           /                                                \
          |    operation 1    operation 2       operion 3    |
          |    _______         _________        ________     |
          |   /       \       /          \     /         \   |
Input --> |  | Import  | --> | CSV parse | -> | Update db |  | --> Success
          |   \_______/       \_________/      \_________/   |
          |      \                 \                 \       |
          |       v_________________v_________________v___-> | --> Error
           \                                                /
            \______________________________________________/


            - Use case is a function is build from smaller functions combined into a pipeline,
              each representing one step in a data flow.

            - One function's output in the input of another one

            - We have to release whole process on error

            - Deviation the success track means the use case is failed

            - The result of operation decides about changing the track
=end
