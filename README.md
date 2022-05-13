# Good Question

## Generating Questions from a Story
There are several projects that can generate questions given a text such as:
https://direct.mit.edu/tacl/article/doi/10.1162/tacl_a_00415/107615/PAQ-65-Million-Probably-Asked-Questions-and-What
Now, not all of these questions are going to be great.  Can you write some code that finds the best questions out of the things that get generated?  (As a bonus, if the questions are sorted in some way, that would be better).  

This program runs on list of questions. It identifies good questions and sorts them in _______. 

## Pre-project:
What makes a question good question?
A question is considered to be good considering all these categories (Categories devised by me)

- Relevance and Context
- Clarity
- Concision
- Clarity
- Open Ended Nature
- Depth and Engagement
- Vagueness

In my model to identify the good-est questions of all, I have decided to incorporate these categories and grade each question through of these categories. Some of these categories can be overlapping and contradicting, hence I came up with 4 out of these 7 criteria which can be very crucial in determining goodness of a question. These 5 pointers are really challenging to measure, however, I have created a semi-formal model for each of them considering the text is a story. There were a lot of assumptions that were taken into consideration in order to come up with these models. I will be briefing about the general model first and will move to each specific criterion models and discuss the assumptions and possibility of extension of that particular model. 

## Good Question Identifier:

The model will identify questions that are good using a traditional grading system with the help of 4 criteria. a) Relevance and Context, and b) Open Ended Nature. Each criterion is given a grading scale respective to their importance in formation of a good question and total tallies upto 11 points. The grade scale is described below. The models in each criterion will determine how many points each question is worth. If the combined tally of points from each criterion is more than or equal to 21 points (70%), the question is considered as a good question. The program will sort the questions in an order that starts from the good-est question to the worst. 

Some of the text processing ML algorithms I used in my models are:
- Stopwords filteration
- Tokenization
- Stemming and Lemmatizing 
- Matrix Factorization
- Word sense disambiguation

Here are the 4 criteria and their models:

1) Relevance & Context:
Stopwords filteration is ran on the story.txt file along with tokenization which will remove all the punctuations and stop words and tokenize the remaining words storing them in a list. These remaining list or words are then iterated over and a relative frequency is calculated by the (# occurances/ # total words). 
Stopwords filteration and tokenization is also ran on each questions and each word in the question is checked against the list of words from the story.txt and the corresponding relative frequency is calculated. This is how each question will get its respective score and will be graded according to the grading scheme provided below:

| Relative frequency sum of the question <br/> (% of words present from the total words in the text) | Relevance and Context grades |
| ------------- | ------------- |
| below 0.05 | 1  |
| 0.05 - 0.10| 3  |
| 0.10 - 0.20| 4  |
| 0.20 - 0.30| 5  |
| 0.30 - 0.40| 6  |
| 0.40 - 0.50| 7  |
| above 0.50 | 8  |

2) Open Ended Nature:
A question must be open-ended in order to be considered as a good question. In order to check the open-ended-ness of a question I will be using a model that highly relies on command terms. After a lot of research and development, and use of few online resources, I was able to come up with a model on how to test the open-endedness of any question (to some extent). The model goes as follows:
  - Check whether the question ends with a "?" or not. If it does, check its first word and test it through the first_word_list to obtain a value of the question. If not, check whether the question contains any command terms and test it through the command_term_list to obtain a value of question.
I was able to categorise command terms in 8 different categories according to their open-ended-ness. The model will look up for the command term present present in the question and the question will be graded according to the rubric. I was also able to sort the first word list according the open-endedness of each term. The rubrics are provided below:

| List of Command terms  | Open Ended Nature grades |
| ------------- | ------------- |
| Calculate, Classify, Formulate, Integrate, Measure, Plot, Select | 1  |
| Define, Determine, Differentiate, Estimate, Find, Label, Recall, State, List, Identify, Predict | 2  |
| Annotate, Comment, Deduce, Derive, Distinguish, Find, Otherwise, Prove, Solve, Suggest | 3  |
| Apply, Draw, Describe, Distinguish, Trace, Outline, Use, Verify | 4  |
| Construct, Demonstrate, Explore, Justify | 5  |
| Compare, Contrast, Critique, Deduce, Explain, Interpret | 6  |
| Examine, Investigate, Synthesize  | 7  |
| Analyze, Discuss, Evaluate, Justify, Create, Design | 8  |

The whole model is used with a set of assumptions being:
1) A question will always have exactly one command term present. If multiple found, the question will be graded only in accordance to the first command term found.
2) If no command terms are found, the question is graded 0 for Open Ended Nature.


## Sample Program
Story.txt and Questions.txt are two sample files that I have provided to test the model. Story.txt is a chapter from a short story and Questions.txt is a list of questions regarding to the story where each line is a new question. 
