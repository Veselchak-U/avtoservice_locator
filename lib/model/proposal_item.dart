class ProposalItem {
  String id;
  String name;
  int price;
  String address;
  String location;
  double rating;
  int counterFeedbacks;

  ProposalItem(
      {String id,
      String name,
      int price,
      String address,
      String location,
      double rating,
      int counterFeedbacks})
      : this.id = id,
        this.name = name,
        this.price = price,
        this.address = address,
        this.location = location,
        this.rating = rating,
        this.counterFeedbacks = counterFeedbacks;
}
