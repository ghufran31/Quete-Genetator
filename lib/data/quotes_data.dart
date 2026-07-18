import '../models/quote_model.dart';

final List<Quote> predefinedQuotes = [
  // Motivation
  Quote(
    text: "The only way to do great work is to love what you do.",
    author: "Steve Jobs",
    category: "Motivation",
  ),
  Quote(
    text:
        "It does not matter how slowly you go as long as you do not stop.",
    author: "Confucius",
    category: "Perseverance",
  ),
  Quote(
    text:
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    author: "Winston Churchill",
    category: "Success",
  ),
  Quote(
    text:
        "Believe you can and you're halfway there.",
    author: "Theodore Roosevelt",
    category: "Motivation",
  ),
  Quote(
    text:
        "In the middle of every difficulty lies opportunity.",
    author: "Albert Einstein",
    category: "Wisdom",
  ),
  Quote(
    text:
        "The future belongs to those who believe in the beauty of their dreams.",
    author: "Eleanor Roosevelt",
    category: "Dreams",
  ),
  Quote(
    text:
        "It always seems impossible until it's done.",
    author: "Nelson Mandela",
    category: "Perseverance",
  ),
  Quote(
    text:
        "Your time is limited, so don't waste it living someone else's life.",
    author: "Steve Jobs",
    category: "Life",
  ),
  Quote(
    text:
        "The best time to plant a tree was 20 years ago. The second best time is now.",
    author: "Chinese Proverb",
    category: "Wisdom",
  ),
  Quote(
    text: "You are never too old to set another goal or to dream a new dream.",
    author: "C.S. Lewis",
    category: "Dreams",
  ),
  Quote(
    text:
        "Life is what happens when you're busy making other plans.",
    author: "John Lennon",
    category: "Life",
  ),
  Quote(
    text:
        "The way to get started is to quit talking and begin doing.",
    author: "Walt Disney",
    category: "Action",
  ),
  Quote(
    text:
        "Don't watch the clock; do what it does. Keep going.",
    author: "Sam Levenson",
    category: "Perseverance",
  ),
  Quote(
    text:
        "Whether you think you can or you think you can't, you're right.",
    author: "Henry Ford",
    category: "Mindset",
  ),
  Quote(
    text:
        "An unexamined life is not worth living.",
    author: "Socrates",
    category: "Philosophy",
  ),
  Quote(
    text:
        "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
    author: "Albert Einstein",
    category: "Humor",
  ),
  Quote(
    text:
        "Be yourself; everyone else is already taken.",
    author: "Oscar Wilde",
    category: "Identity",
  ),
  Quote(
    text:
        "So many books, so little time.",
    author: "Frank Zappa",
    category: "Books",
  ),
  Quote(
    text:
        "A room without books is like a body without a soul.",
    author: "Marcus Tullius Cicero",
    category: "Books",
  ),
  Quote(
    text:
        "You only live once, but if you do it right, once is enough.",
    author: "Mae West",
    category: "Life",
  ),
  Quote(
    text:
        "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.",
    author: "Ralph Waldo Emerson",
    category: "Identity",
  ),
  Quote(
    text:
        "In three words I can sum up everything I've learned about life: it goes on.",
    author: "Robert Frost",
    category: "Life",
  ),
  Quote(
    text:
        "If you tell the truth, you don't have to remember anything.",
    author: "Mark Twain",
    category: "Wisdom",
  ),
  Quote(
    text:
        "A friend is someone who knows all about you and still loves you.",
    author: "Elbert Hubbard",
    category: "Friendship",
  ),
  Quote(
    text:
        "To live is the rarest thing in the world. Most people exist, that is all.",
    author: "Oscar Wilde",
    category: "Life",
  ),
  Quote(
    text:
        "Darkness cannot drive out darkness; only light can do that. Hate cannot drive out hate; only love can do that.",
    author: "Martin Luther King Jr.",
    category: "Love",
  ),
  Quote(
    text:
        "Without music, life would be a mistake.",
    author: "Friedrich Nietzsche",
    category: "Music",
  ),
  Quote(
    text:
        "I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel.",
    author: "Maya Angelou",
    category: "Empathy",
  ),
  Quote(
    text:
        "Always forgive your enemies; nothing annoys them so much.",
    author: "Oscar Wilde",
    category: "Humor",
  ),
  Quote(
    text:
        "We accept the love we think we deserve.",
    author: "Stephen Chbosky",
    category: "Love",
  ),
  Quote(
    text:
        "Fairy tales are more than true: not because they tell us that dragons exist, but because they tell us that dragons can be beaten.",
    author: "Neil Gaiman",
    category: "Courage",
  ),
  Quote(
    text:
        "It is not the mountain we conquer, but ourselves.",
    author: "Sir Edmund Hillary",
    category: "Courage",
  ),
  Quote(
    text:
        "Do one thing every day that scares you.",
    author: "Eleanor Roosevelt",
    category: "Courage",
  ),
  Quote(
    text: "Not all those who wander are lost.",
    author: "J.R.R. Tolkien",
    category: "Adventure",
  ),
  Quote(
    text:
        "We know what we are, but know not what we may be.",
    author: "William Shakespeare",
    category: "Philosophy",
  ),
  Quote(
    text:
        "Yesterday is history, tomorrow is a mystery, today is a gift of God, which is why we call it the present.",
    author: "Bill Keane",
    category: "Mindfulness",
  ),
  Quote(
    text: "Spread love everywhere you go. Let no one ever come to you without leaving happier.",
    author: "Mother Teresa",
    category: "Love",
  ),
  Quote(
    text: "When you reach the end of your rope, tie a knot in it and hang on.",
    author: "Franklin D. Roosevelt",
    category: "Perseverance",
  ),
  Quote(
    text: "Always remember that you are absolutely unique. Just like everyone else.",
    author: "Margaret Mead",
    category: "Humor",
  ),
  Quote(
    text: "Do not go where the path may lead, go instead where there is no path and leave a trail.",
    author: "Ralph Waldo Emerson",
    category: "Adventure",
  ),
  Quote(
    text: "You will face many defeats in life, but never let yourself be defeated.",
    author: "Maya Angelou",
    category: "Resilience",
  ),
  Quote(
    text: "The greatest glory in living lies not in never falling, but in rising every time we fall.",
    author: "Nelson Mandela",
    category: "Resilience",
  ),
  Quote(
    text: "In the end, it's not the years in your life that count. It's the life in your years.",
    author: "Abraham Lincoln",
    category: "Life",
  ),
  Quote(
    text: "Never let the fear of striking out keep you from playing the game.",
    author: "Babe Ruth",
    category: "Courage",
  ),
  Quote(
    text: "Life is either a daring adventure or nothing at all.",
    author: "Helen Keller",
    category: "Adventure",
  ),
  Quote(
    text: "Many of life's failures are people who did not realize how close they were to success when they gave up.",
    author: "Thomas A. Edison",
    category: "Success",
  ),
  Quote(
    text: "You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.",
    author: "Dr. Seuss",
    category: "Motivation",
  ),
  Quote(
    text: "If life were predictable it would cease to be life, and be without flavor.",
    author: "Eleanor Roosevelt",
    category: "Life",
  ),
  Quote(
    text: "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough.",
    author: "Oprah Winfrey",
    category: "Gratitude",
  ),
  Quote(
    text: "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success.",
    author: "James Cameron",
    category: "Goals",
  ),
  Quote(
    text: "Life is not measured by the number of breaths we take, but by the moments that take our breath away.",
    author: "Maya Angelou",
    category: "Life",
  ),
];
