enum ItemNotificationType {
  created,
  updated,
  deleted,
}

class ItemNotification<T> {
  final T item;
  final ItemNotificationType type;

  bool get isCreated => type == ItemNotificationType.created;

  const ItemNotification.created(this.item) : type = ItemNotificationType.created;

  const ItemNotification.updated(this.item) : type = ItemNotificationType.updated;

  const ItemNotification.deleted(this.item) : type = ItemNotificationType.deleted;
}
