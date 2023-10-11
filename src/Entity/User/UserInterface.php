<?php

declare(strict_types=1);

namespace App\Entity\User;

interface UserInterface
{
    public function getId(): ?int;

    public function setId(int $id): static;

    public function getName(): ?string;

    public function setName(string $name): static;

    public function getEmail(): ?string;

    public function setEmail(string $email): static;

    public function getPassword(): ?string;

    public function setPassword(string $password): static;

    public function getRole(): ?string;

    public function setRole(string $role): static;
}