# GoogleNewsStandAnimation



It is same like Google News Stand Animation with Customise Configuration file in Swift iOS Technology.

This is the hot spot animation (with 4 swipe Gestures up,Down,Left,right) where user can see his/her information in only single page rather than making multiple views for showing data with Header card + Header card Detail .

Suppose you want to search a weather report of 4 cities A,B,C,D Respectively .

UP/DOWN Swip Gesture Use . 1.User can se A header + A header detail on the same view when he/she will swip the view Up & Down on same screen with animation.(no need to create extra views)

2.User can se B header + B header detail on the same view when he/she will swip the view Up & Down on same screen with animation.(no need to create extra views)

3.User can se C header + C header detail on the same view when he/she will swip the view Up & Down on same screen with animation.(no need to create extra views)

4.User can se D header + D header detail on the same view when he/she will swip the view Up & Down on same screen with animation.(no need to create extra views)

Left/Right Swip Gesture Use . 

1. When user will swipe left from A section he/she can see next neighbour B Section and it will done till end D Section respectively with Animation effect.

2.When user will swipe Right from D section he/she can see next neighbour C Section and it will done till end A Section respectively with Animation effect.

So by this approach here we gave only 4 views in a scroll container which is doing work of 8 table view listing with beautiful animation effect .


Step 1:- Go to your ViewController File and hide "Navigation Bar" for that "ViewController"

Step 2:- Register Delegate in front of your "ViewController":-

class ViewController: UIViewController,AnimatorCardDelegate,AnimatorTableDelegate {

}

Step 3:- Register Delegate Methods in to your ViewController:-

    //MARK:- Animator Delegate Methods 
    func didSelect(item: Model, inCard card: Card) {
        
        print(item.description)
        print(card.description)
        
        let vcDetail = DetailVc()
        vcDetail.titleString = card.strTitle;
        self.navigationController?.pushViewController(vcDetail, animated: true);
        
        
        
    }

    func cardClickedFromTopHeader(card: Card) {
        print(card.description);
        let vcDetail = DetailVc()
        vcDetail.titleString = card.strTitle;
         self.navigationController?.pushViewController(vcDetail, animated: true);
    }
    
    
    
Step 4:- Finally Initialize your Animator in "viewDidLoad()" method of "ViewController":-
  
  //1. initialize animator
  
        Animator.shared.setAnimator(UIImage.init(named: "bg.jpeg"), self.view)
  
        Animator.shared.delegateTable = self;
        
        Animator.shared.delegateCard = self;
        
 
 //2.  Or you can  initialize animator with CARDS( you can configure your cards like this also):-
 
       Animator.shared.setAnimator(UIImage.init(named: "bg.jpeg"), self.view,AnimationConfig(cards: [Card.init(bgImage: "0.png", strTitle: "SCIENCE", items: [ Model() ] ) ]) );
        

Step 5:- 6 Cards are Limit of this NewsStand.


![google_newsstand_like_navigation_pattern](https://user-images.githubusercontent.com/7630897/29168253-beedb910-7deb-11e7-9f2f-45dadfb9853c.gif)
