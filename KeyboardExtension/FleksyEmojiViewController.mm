//
//  FleksyEmojiViewController.m
//  FleksyFramework
//
//  Created by Ben Pious on 11/5/14.
//  Copyright (c) 2014 Syntellia Inc. All rights reserved.
//

#import "FleksyEmojiViewController.h"

#define FLEKSY_EMOJI_REUSE_ID @"emojiCell"

@interface FleksyEmojiCell : UICollectionViewCell

@property UILabel* label;

@end

@implementation FleksyEmojiCell

-(instancetype) initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame: frame]) {
    self.label = [[UILabel alloc] initWithFrame: frame];
    [self.contentView addSubview: self.label];
  }
  return self;
}

@end

@interface FleksyEmojiViewController ()
@property UICollectionView* collectionView;
@property NSArray* emojiViewCache;
@end

@implementation FleksyEmojiViewController

- (instancetype) initWithFrame:(CGRect)frame {
  if (self = [super init]) {
    
    self.view.frame = frame;
    
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(50.0, 50.0);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0,
                                                                              0,
                                                                              frame.size.width,
                                                                              frame.size.height)
                                             collectionViewLayout: layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass: [FleksyEmojiCell class]
            forCellWithReuseIdentifier: FLEKSY_EMOJI_REUSE_ID];
    self.collectionView.backgroundColor = [UIColor clearColor];
    UISwipeGestureRecognizer* swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget: self
                                                                                          action: @selector(swiped:)];
    [self.view addGestureRecognizer: swipeRecognizer];
    [self.view addSubview: self.collectionView];
  }
  
  return self;
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
  return 50;
//  NSString* currEmojiSection = [FleksyEmojiViewController emojis][section];
//  FLUnicodeString uString = _NSStringToString(currEmojiSection);
//  return uString.length();
//  int characterIndex = 0;
//  FLUnicodeString uString = _NSStringToString([FleksyEmojiViewController emojis][section]);
//  for (int i = 0; i < uString.length();) {
//    FLUnicodeString grapheme = uString.graphemeAtIndex(i);
//    i+= grapheme.length();
//    characterIndex+= 1;
//  }
//  return characterIndex;
}

-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  FleksyEmojiCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier: FLEKSY_EMOJI_REUSE_ID
                                                                         forIndexPath: indexPath];
//  NSString* emoji = [self emojiForSection: indexPath.section
//                                    index: indexPath.item];
  
  cell.label.text = @"c";
//  cell.contentView.backgroundColor = [UIColor whiteColor];
  return cell;
}

-(void) generateEmojiCache
{
  //TODO: move emoji view creation logic here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
  self.emojiViewCache = nil;
}


-(void) collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
  UILabel* label = [((FleksyEmojiCell*)[collectionView cellForItemAtIndexPath: indexPath]) label];
}

//-(NSString*) emojiForSection: (NSUInteger) section
//                       index: (NSUInteger) index {
//  
//  NSString* currEmojiSection = [FleksyEmojiViewController emojis][section];
//  FLUnicodeString uString = _NSStringToString(currEmojiSection);
//  int characterIndex = 0;
//  for (int i = 0; i < uString.length();) {
//    
//    FLUnicodeString grapheme = uString.graphemeAtIndex(i);
//    if (characterIndex == index) {
//      return _StringToNSString(grapheme);
//    }
//    i+= grapheme.length();
//    characterIndex+= 1;
//  }
//  
//  return nil;
//}

+(NSArray*) emojis {
  
  return  @[@"\
😄😃😀😊☺️😉😍😘😚😗😙😜😝😛\
😳😁😔😌😒😞😣😢😂😭😪😥😰😅\
😓😩😫😨😱😠😡😤😖😆😋😷😎😴\
😵😲😟😦😧😈👿😮😬😐😕😯😶😇\
😏😑👲👳👮👷💂👶👦👧👨👩👴👵\
👱👼👸😺😸😻😽😼🙀😿😹😾👹👺\
🙈🙉🙊💀👽💩🔥✨🌟💫💥💢💦💧\
💤💨👂👀👃👅👄👍👎👌👊✊✌👋\
✋👐👆👇👉👈🙌🙏☝👏💪🚶🏃💃\
👫👪👬👭💏💑👯🙆🙅💁🙋💆💇💅\
👰🙎🙍🙇🎩👑👒👟👞👡👠👢👕👔\
👚👗🎽👖👘👙💼👜👝👛👓🎀🌂💄\
💛💙💜💚❤💔💗💓💕💖💞💘💌💋\
💍💎👤👥💬👣💭",
@"\
🐶🐺🐱🐭🐹🐰🐸🐯🐨🐻🐷🐽🐮🐗\
🐵🐒🐴🐑🐘🐼🐧🐦🐤🐥🐣🐔🐍🐢\
🐛🐝🐜🐞🐌🐙🐚🐠🐟🐬🐳🐋🐄🐏\
🐀🐃🐅🐇🐉🐎🐐🐓🐕🐖🐁🐂🐲🐡\
🐊🐫🐪🐆🐈🐩🐾💐🌸🌷🍀🌹🌻🌺\
🍁🍃🍂🌿🌾🍄🌵🌴🌲🌳🌰🌱🌼🌐\
🌞🌝🌚🌑🌒🌓🌔🌕🌖🌗🌘🌜🌛🌙\
🌍🌎🌏🌋🌌🌠⭐☀⛅☁⚡☔❄⛄\
🌀🌁🌈🌊",
@"\
🎍💝🎎🎒🎓🎏🎆🎇🎐🎑🎃👻🎅🎄\
🎁🎋🎉🎊🎈🎌🔮🎥📷📹📼💿📀💽\
💾💻📱☎📞📟📠📡📺📻🔊🔉🔈🔇\
🔔🔕📢📣⏳⌛⏰⌚🔓🔒🔏🔐🔑🔎\
💡🔦🔆🔅🔌🔋🔍🛁🛀🚿🚽🔧🔩🔨\
🚪🚬💣🔫🔪💊💉💰💴💵💷💶💳💸\
📲📧📥📤✉📩📨📯📫📪📬📭📮📦\
📝📄📃📑📊📈📉📜📋📅📆📇📁📂\
✂📌📎✒✏📏📐📕📗📘📙📓📔📒\
📚📖🔖📛🔬🔭📰🎨🎬🎤🎧🎼🎵🎶\
🎹🎻🎺🎷🎸👾🎮🃏🎴🀄🎲🎯🏈🏀\
⚽⚾🎾🎱🏉🎳⛳🚵🚴🏁🏇🏆🎿🏂\
🏊🏄🎣☕🍵🍶🍼🍺🍻🍸🍹🍷🍴🍕\
🍔🍟🍗🍖🍝🍛🍤🍱🍣🍥🍙🍘🍚🍜\
🍲🍢🍡🍳🍞🍩🍮🍦🍨🍧🎂🍰🍪🍫\
🍬🍭🍯🍎🍏🍊🍋🍒🍇🍉🍓🍑🍈🍌\
🍐🍍🍠🍆🍅🌽",
@"\
🏠🏡🏫🏢🏣🏥🏦🏪🏩🏨💒⛪🏬🏤\
🌇🌆🏯🏰⛺🏭🗼🗾🗻🌄🌅🌃🗽🌉\
🎠🎡⛲🎢🚢⛵🚤🚣⚓🚀✈💺🚁🚂\
🚊🚉🚞🚆🚄🚅🚈🚇🚝🚋🚃🚎🚌🚍\
🚙🚘🚗🚕🚖🚛🚚🚨🚓🚔🚒🚑🚐🚲\
🚡🚟🚠🚜💈🚏🎫🚦🚥⚠🚧🔰⛽🏮\
🎰♨🗿🎪🎭📍🚩",

@"\
 1⃣2⃣3⃣4⃣5⃣6⃣7⃣8⃣9⃣0⃣🔟🔢#⃣🔣⬆️⬇️⬅️➡️🔠🔡🔤\
↗↖↘↙\
↔↕🔄◀▶🔼🔽↩↪ℹ⏪⏩⏫⏬\
⤵⤴🆗🔀🔁🔂🆕🆙🆒🆓🆖📶🎦🈁\
🈯🈳🈵🈴🈲🉐🈹🈺🈶🈚🚻🚹🚺🚼\
🚾🚰🚮🅿♿🚭🈷🈸🈂Ⓜ🛂🛄🛅🛃\
🉑㊙㊗🆑🆘🆔🚫🔞📵🚯🚱🚳🚷🚸\
⛔✳❇❎✅✴💟🆚📳📴🅰🅱🆎🅾\
💠➿♻♈♉♊♋♌♍♎♏♐♑♒\
♓⛎🔯🏧💹💲💱©®™❌‼⁉❗\
❓❕❔⭕🔝🔚🔙🔛🔜🔃🕛🕧🕐🕜\
🕑🕝🕒🕞🕓🕟🕔🕠🕕🕖🕗🕘🕙🕚\
🕡🕢🕣🕤🕥🕦✖➕➖➗♠♥♣♦\
💮💯✔☑🔘🔗➰〰〽🔱◼◻◾◽\
▪▫🔺🔲🔳⚫⚪🔴🔵🔻⬜⬛🔶🔷\
            🔸🔹"
            ];
}

@end