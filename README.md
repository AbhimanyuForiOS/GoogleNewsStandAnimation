# GoogleNewsStandAnimation
It is same like Google News Stand Animation with Customise Configuration file in Swift iOS Technology.

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
