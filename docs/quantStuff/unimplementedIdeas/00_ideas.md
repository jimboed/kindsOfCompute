# ideas that have not yet been implemented


### j rad.
- (j rad) Instead of immediately starting to trade once the system is working, we let it run for a while to gather reliability data on whatever sources we are using to generate sentiment. (jim) Not just a recommendation, but also a confidence weight and the data analysis trail to prove that confidence. 

- (j rad) random injection of new tags to the sentiment analysis. That might be a down the road kind of thing, but it might keep us from having to be reactive to new market influences. The system could maybe just find those itself.




### jimbo.
- for each ... track major eigenvalues of time delay embeddings over time with a moving window. 
    - its obvious that the eigens will change over time. but does how it changes over time give info about a prediction that can be made as the change propogates through the system that is being described by the new eigens? 
    - for more: 
        - https://www.youtube.com/watch?v=7N2D226vYCQ


- think of eigen-faces. 
    - you can use any random population of faces to create a library of eigenfaces.
    - you can then bring in an unseen new face, from an unseen new person, and use your library of eigen faces to describe that new face. 
    - you can do that for an entire population, and use your eigenfaces library to distinguish among faces in the population that arent actually used as part of the library. 

    - you can think of the same for stocks. you can think of a random (as long as it is really random) set of stocks as the basis for an eigen library, and use that library as the basis for distinguishing behaviors with a moving window. 

    - if the library covers a large set of behaviors, you can use the changes in the description of the stock as a signal for changes in behaviors. 
    - and you can use the library as clustering descriptors to show you when one stock starts behaving like another stock, so you can use one to predict another. 

    - kiss mby butt -- by jim. 


