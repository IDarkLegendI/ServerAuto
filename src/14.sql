CREATE PROCEDURE AddOwnerVehiclePair
    @PeopleId INT,
    @VehicleId INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM PeopleVehicle WHERE PeopleId = @PeopleId AND VehicleId = @VehicleId)
BEGIN
INSERT INTO PeopleVehicle (PeopleId, VehicleId) VALUES (@PeopleId, @VehicleId);
END
END;
