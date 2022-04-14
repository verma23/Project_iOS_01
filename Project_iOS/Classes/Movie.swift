//
//  Movie.swift
//  Project_iOS
//
//  Created by Karn Bhavsar  on 2022-03-26.
//  This class is for Movie Collection list  and Movie Details

import UIKit

struct Movie {
    let title: String // To store the movie title
    let image: UIImage // TO store the movie image
    let summary: String // To store the movie summary
    let trailer: String // To store the youtube id for the movie trailer
    let imageName: String
}

// An array to hold all the movie details
let movies: [Movie] = [
    Movie(title: "Captain America: The First Avenger", image: UIImage(imageLiteralResourceName: "movie1"), summary: "Steve Rogers, a rejected military soldier, transforms into Captain America after taking a dose of a Super-Soldier serum. But being Captain America comes at a price as he attempts to take down a war monger and a terrorist organization.", trailer: "W4DlMggBPvc", imageName: "movie1"),
    Movie(title: "Captain Marvel", image: UIImage(imageLiteralResourceName: "movie2"), summary: "Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.", trailer: "Z1BCujX3pw8", imageName: "movie2"),
    Movie(title: "Iron Man", image: UIImage(imageLiteralResourceName: "movie3"), summary: "After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.", trailer: "8ugaeA-nMTc", imageName: "movie3"),
    Movie(title: "Iron Man 2", image: UIImage(imageLiteralResourceName: "movie4"), summary: "With the world now aware of his identity as Iron Man, Tony Stark must contend with both his declining health and a vengeful mad man with ties to his father's legacy.", trailer: "BoohRoVA9WQ", imageName: "movie4"),
    Movie(title: "Thor", image: UIImage(imageLiteralResourceName: "movie5"), summary: "The powerful but arrogant god Thor is cast out of Asgard to live amongst humans in Midgard (Earth), where he soon becomes one of their finest defenders.", trailer: "JOddp-nlNvQ", imageName: "movie5"),
    Movie(title: "The Avengers", image: UIImage(imageLiteralResourceName: "movie6"), summary: "Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.", trailer: "eOrNdBpGMv8", imageName: "movie6"),
    Movie(title: "Thor: The Dark World", image: UIImage(imageLiteralResourceName: "movie7"), summary: "When the Dark Elves attempt to plunge the universe into darkness, Thor must embark on a perilous and personal journey that will reunite him with doctor Jane Foster.", trailer: "npvJ9FTgZbM", imageName: "movie7"),
    Movie(title: "Iron Man 3", image: UIImage(imageLiteralResourceName: "movie8"), summary: "When Tony Stark's world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution.",trailer: "YLorLVa95Xo", imageName: "movie8"),
    Movie(title: "Captain America: The Winter Soldier", image: UIImage(imageLiteralResourceName: "movie9"), summary: "As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat from history: an assassin known as the Winter Soldier.", trailer: "tbayiPxkUMM", imageName: "movie9"),
    Movie(title: "Guardian Of The Galaxy", image: UIImage(imageLiteralResourceName: "movie10"),summary: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",trailer: "d96cjJhvlMA", imageName: "movie10"),
    Movie(title: "Guardian Of The Galaxy Vol 2", image: UIImage(imageLiteralResourceName: "movie11"),summary: "The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father the ambitious celestial being Ego.",trailer: "wUn05hdkhjM", imageName: "movie11"),
    Movie(title: "Avengers: Age Of Ultron", image: UIImage(imageLiteralResourceName: "movie12"),summary: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.",trailer: "JAUoeqvedMo", imageName: "movie12"),
    Movie(title: "Ant Man", image: UIImage(imageLiteralResourceName: "movie13"),summary: "Armed with a super-suit with the astonishing ability to shrink in scale but increase in strength, cat burglar Scott Lang must embrace his inner hero and help his mentor, Dr. Hank Pym, pull off a plan that will save the world.",trailer: "pWdKf3MneyI", imageName: "movie13"),
    Movie(title: "Captain America: Civil War", image: UIImage(imageLiteralResourceName: "movie14"),summary: "Political involvement in the Avengers' affairs causes a rift between Captain America and Iron Man.",trailer: "dKrVegVI0Us", imageName: "movie14"),
    Movie(title: "Black Window", image: UIImage(imageLiteralResourceName: "movie15"),summary: "Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.",trailer: "ybji16u608U", imageName: "movie15"),
    Movie(title: "Spider Man: Homecoming", image: UIImage(imageLiteralResourceName: "movie16"),summary: "Peter Parker balances his life as an ordinary high school student in Queens with his superhero alter-ego Spider-Man, and finds himself on the trail of a new menace prowling the skies of New York City.",trailer: "rk-dF1lIbIg", imageName: "movie16"),
    Movie(title: "Black Panther", image: UIImage(imageLiteralResourceName: "movie17"),summary: "T'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country's past.",trailer: "xjDjIWPwcPU", imageName: "movie17"),
    Movie(title: "Doctor Strange", image: UIImage(imageLiteralResourceName: "movie18"),summary: "While on a journey of physical and spiritual healing, a brilliant neurosurgeon is drawn into the world of the mystic arts.",trailer: "HSzx-zryEgM", imageName: "movie18"),
    Movie(title: "Thor: Ragnarok", image: UIImage(imageLiteralResourceName: "movie19"),summary: "Imprisoned on the planet Sakaar, Thor must race against time to return to Asgard and stop Ragnarök, the destruction of his world, at the hands of the powerful and ruthless villain Hela.",trailer: "ue80QwXMRHg", imageName: "movie19"),
    Movie(title: "Ant Man And The Wasp", image: UIImage(imageLiteralResourceName: "movie20"),summary: "As Scott Lang balances being both a superhero and a father, Hope van Dyne and Dr. Hank Pym present an urgent new mission that finds the Ant-Man fighting alongside The Wasp to uncover secrets from their past.",trailer: "UUkn-enk2RU", imageName: "movie20"),
    Movie(title: "Avengers: Infinity War", image: UIImage(imageLiteralResourceName: "movie21"),summary: "The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.",trailer: "6ZfuNTqbHE8", imageName: "movie21"),
    Movie(title: "Avengers: End Game", image: UIImage(imageLiteralResourceName: "movie22"),summary: "After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",trailer: "TcMBFSGVi1c", imageName: "movie22"),
    Movie(title: "Spider Man: Far From Home", image: UIImage(imageLiteralResourceName: "movie23"),summary: "Following the events of Avengers: Endgame (2019), Spider-Man must step up to take on new threats in a world that has changed forever.",trailer: "Nt9L1jCKGnE", imageName: "movie23"),
    Movie(title: "Shang Chi", image: UIImage(imageLiteralResourceName: "movie24"),summary: "Shang-Chi, the master of weaponry-based Kung Fu, is forced to confront his past after being drawn into the Ten Rings organization.",trailer: "8YjFbMbfXaQ", imageName: "movie24"),
    Movie(title: "Eternals", image: UIImage(imageLiteralResourceName: "movie25"),summary: "The saga of the Eternals, a race of immortal beings who lived on Earth and shaped its history and civilizations.",trailer: "x_me3xsvDgk", imageName: "movie25"),
    Movie(title: "Spider Man: No Way Home", image: UIImage(imageLiteralResourceName: "movie26"),summary: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",trailer: "JfVOs4VSpmA", imageName: "movie26"),
    
    
]
