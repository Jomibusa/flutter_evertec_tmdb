enum StatusCode {
  ok(200),
  unauthorized(401),
  notFound(404);

  const StatusCode(this.value);
  final num value;
}
